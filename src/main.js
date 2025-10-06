import express from "express";
import bodyParser from "body-parser";
import { fileURLToPath } from "url";
import { dirname } from "path";
import path from "node:path";
import router from "./routers/router.js";

const app = express();
const port = 13241;

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Middleware and routes
app.use(express.static(path.join(__dirname, "/public")));
app.use(router);

// View engine
app.set("view engine", "ejs");
app.set("views", "./views");

// Body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.listen(port, () => {
  console.log(`#########################################################
        Server listening at http://localhost:${port}
#########################################################`);
});

export default app;
