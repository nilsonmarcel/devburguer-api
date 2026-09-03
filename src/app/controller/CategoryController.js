import * as yup from 'yup';
import Category from './../models/category.js';

class CategoryController {
  async store(request, response) {
    try {
      const schema = yup.object({ name: yup.string().required() });

      try {
        schema.validateSync(request.body, { abortEarly: false });
      } catch (err) {
        return response.status(400).json({ error: err.errors });
      }

      if (!request.file) {
        return response.status(400).json({ error: 'Image is required.' });
      }

      const { name } = request.body;
      const { filename } = request.file;

      const existingCategory = await Category.findAll({ where: { name } });

      if (existingCategory.length > 0) {
        return response.status(400).json({ error: 'Category already exists.' });
      }

      const newCategory = await Category.create({ name, path: filename });

      return response.status(201).json(newCategory);
    } catch (err) {
      console.error('ERRO NO STORE:', err); // <- vai aparecer no terminal
      return response.status(500).json({ error: err.message });
    }
  }

  async update(request, response) {
    const schema = yup.object({
      name: yup.string(),
    });

    try {
      schema.validateSync(request.body, { abortEarly: false });
    } catch (err) {
      return response.status(400).json({ error: err.errors });
    }

    const { name } = request.body;
    const { id } = request.params;

    let path;
    if (request.file) {
      const { filename } = request.file;
      path = filename;
    }

    const existingCategory = await Category.findAll({
      where: {
        name,
      },
    });

    if (existingCategory.length > 0) {
      return response.status(400).json({ error: 'Category already exists.' });
    }

    await Category.update(
      {
        name,
        path,
      },
      {
        where: {
          id,
        },
      },
    );

    return response.status(201).json();
  }

  async index(_request, response) {
    const categories = await Category.findAll();

    return response.status(200).json(categories);
  }
}

export default new CategoryController();
