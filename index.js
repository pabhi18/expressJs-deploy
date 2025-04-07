import express from 'express';
import cors from 'cors';
// import apicache from 'apicache';
import helmet from 'helmet';
import morgan from 'morgan';
import userRoutes from './routes/userRoutes.js';
import swaggerJsdoc from 'swagger-jsdoc';
import swaggerUi from 'swagger-ui-express';

const app = express();
// const cache = apicache.middleware;

// Swagger configuration
const swaggerOptions = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Node.js React MySQL API',
      version: '1.0.0',
      description: 'API documentation for Node.js React MySQL application',
    },
    servers: [
      {
        url: 'http://localhost:3000',
        description: 'Development server',
      },
    ],
  },
  apis: ['./routes/*.js'], // Path to the API routes
};

const swaggerSpec = swaggerJsdoc(swaggerOptions);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.use(helmet());
app.use(express.json());
app.use(cors());
app.use(morgan('combined'));
// app.use(cache('5 minutes'));
app.use('/api', userRoutes);

app.listen(3000);
