import express from "express";
import { fileURLToPath } from "url";
import { dirname } from "path";
import path from "node:path";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const __views = __dirname + "/views/";

const app = express();
const port = 3456;

app.use(express.static(path.join(__dirname, "/public")));

app.set("views", "./views");

app.get("/", (req, res) => {
  res.redirect("/mint");
});

app.get("/mint", (req, res) => {
  res.sendFile(__views + "page1.html");
});

app.get("/orchard", (req, res) => {
  res.sendFile(__views + "page2.html");
});

app.get("/interface", (req, res) => {
  res.sendFile(__views + "page3.html");
});

app.get("/thunderstorm", (req, res) => {
  res.sendFile(__views + "page4.html");
});

app.get("/characterized", (req, res) => {
  res.sendFile(__views + "page5.html");
});

app.get("/incompatibility", (req, res) => {
  res.sendFile(__views + "page6.html");
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
