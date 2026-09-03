import 'dotenv/config';
import { Sequelize } from 'sequelize';
import mongoose from 'mongoose';
import DatabaseConfig from '../config/database.cjs';
import User from '../app/models/User.js';
import Product from '../app/models/product.js';
import Category from '../app/models/category.js';

const models = [User, Product, Category];

class Database {
  constructor() {
    this.init();
    this.mongo();
  }

  init() {
    this.connection = new Sequelize(DatabaseConfig);
    models
      .map((model) => model.init(this.connection))
      .map(
        (model) => model.associate && model.associate(this.connection.models),
      );
  }
  mongo() {
    this.mongoConnection = mongoose.connect(
      process.env.MONGO_URI
    );
  }
}

export default new Database();
