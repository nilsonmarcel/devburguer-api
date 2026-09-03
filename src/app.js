import express from 'express';
import './database/index.js';
import routes from './routes.js';
import filesRouteConfig from './config/fileRoutes.cjs';

import cors from 'cors';

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/product-file', filesRouteConfig);
app.use('/category-file', filesRouteConfig);

app.use(routes);

export default app;
