import express from "express";
import { fileURLToPath } from "url";
import { dirname } from "path";
import path from "node:path";
import { text } from "./public/js/text/text.js";
import { loadCSV } from "./public/utils/utilities.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();
const port = 12141;

app.use(express.static(path.join(__dirname, "/public")));

app.set("view engine", "ejs");

app.set("views", "./views");

app.get("/", (req, res) => {
  res.redirect("/basic");
});

app.get("/basic", (req, res) => {
  const data = text[0];
  res.render("scr1", {
    data: data,
  });
});

app.get("/genre", (req, res) => {
  const data = text[1];
  res.render("scr2", {
    data: data,
  });
});

app.get("/box-office", (req, res) => {
  const data = text[2];
  res.render("scr3", {
    data: data,
  });
});

app.get("/misc", (req, res) => {
  const data = text[3];
  res.render("scr4", {
    data: data,
  });
});

app.get("/trends", (req, res) => {
  const data = text[4];
  res.render("scr5", {
    data: data,
  });
});

app.get("/recent", (req, res) => {
  const data = text[5];
  res.render("scr6", {
    data: data,
  });
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
