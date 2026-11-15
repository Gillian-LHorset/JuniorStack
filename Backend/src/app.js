import express from "express";
import cors from "cors";
import { developerProfileController } from "./controllers/dev_controller.js";

const app = express();

app.use(cors());
app.use(express.json());

app.get("/dev", (req, res) => {
  res.json(developerProfileController.index());
});

export default app;
