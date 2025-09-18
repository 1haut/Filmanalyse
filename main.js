import express from "express";
import { fileURLToPath } from "url";
import { dirname } from "path";
import path from "node:path";
import { text } from "./public/js/text/text.js";
import { loadCSV } from "./public/utils/utilities.js";
import * as chart from "./public/utils/cfg.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();
const port = 12141;

app.use(express.static(path.join(__dirname, "/public")));

app.set("view engine", "ejs");

app.set("views", "./views");

const chartConfigObj = {
  bar: chart.barChart,
  line: chart.lineChart,
  pie: chart.pieChart,
  doughnut: chart.doughnutChart,
  scatter: chart.scatterChart,
};

function setConfigs(type, csv) {
  const [labels, values, titles] = csv;
  const config = chartConfigObj[type];
  switch (type) {
    case "scatter":
      const xValues = values[0];
      const yValues = values[1];
      config.data.datasets = xValues.map((value, index) => ({
        labels: labels[index],
        data: [
          {
            x: xValues[index],
            y: yValues[index],
          },
        ],
      }));
      break;
    case "bar":
    case "line":
    case "pie":
    case "doughnut":
      config.data.labels = labels;
      values.forEach((row, index) => {
        config.data.datasets[index].label = titles[index];
        config.data.datasets[index].data = row;
      });
      break;
    default:
      throw Error("No chart generated");
  }

  return config;
}

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

// app.listen(port, () => {
//   console.log(`Server listening at http://localhost:${port}`);
// });
