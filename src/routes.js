import { Router } from 'express';
import SessionController from './app/controller/sessionController.js';
import UserController from './app/controller/UserController.js';
import ProductController from './app/controller/ProductController.js';
import multer from 'multer';
import multerConfig from './config/multer.cjs';
import authMiddleware from './app/middlewares/auth.js';
import CategoryController from './app/controller/CategoryController.js';
import adminMiddleware from './app/middlewares/admin.js';
import OrderController from './app/controller/OrderController.js';

const routes = new Router();

const upload = multer(multerConfig);

routes.post('/users', UserController.store);
routes.post('/sessions', SessionController.store);
// camada de segurança
routes.use(authMiddleware);
routes.post(
  '/products',
  adminMiddleware,
  upload.single('file'),
  ProductController.store,
);
routes.put(
  '/products/:id',
  adminMiddleware,
  upload.single('file'),
  ProductController.update,
);
routes.get('/products', ProductController.index);

routes.post(
  '/categories',
  adminMiddleware,
  upload.single('file'),
  CategoryController.store,
);
routes.put(
  '/categories/:id',
  adminMiddleware,
  upload.single('file'),
  CategoryController.update,
);
routes.get('/categories', CategoryController.index);

routes.post('/orders', OrderController.store);
routes.get('/orders', OrderController.index);
routes.put('/orders/:id', adminMiddleware, OrderController.update);

export default routes;
