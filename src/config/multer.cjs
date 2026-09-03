const multer = require('multer');
const { resolve } = require('node:path');
const { v4 } = require('uuid');

module.exports = {
    storage: multer.diskStorage({
        destination: resolve(__dirname, '..', '..', 'uploads'),
            filename: (_request, file, collback) => {
                const uniqueName = v4().concat(`${file.originalname}`);
                return collback(null, uniqueName);
            },
    }),
};