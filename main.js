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
  const config = structuredClone(chartConfigObj[type]);
  switch (type) {
    case "scatter":
      const xValues = values[0];
      const yValues = values[1];
      config.data.datasets = xValues.map((value, index) => ({
        label: labels[index],
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
        const newData = JSON.parse(JSON.stringify(config.data.datasets[0]));
        newData.label = titles[index];
        newData.data = row;
        config.data.datasets[index + 1] = newData;
      });
      config.data.datasets.shift();
      break;
    default:
      throw Error("No chart generated! \nType: " + type);
  }

  return config;
}

function configsAllCharts(chartData) {
  return chartData.titles.map((el, i) => {
    const resData = loadCSV("public/" + chartData.paths[i]);
    const chartConfigs = setConfigs(chartData.chartTypes[i], resData);

    return chartConfigs;
  });
}

app.get("/", (req, res) => {
  res.redirect("/basic");
});

app.get("/basic", (req, res) => {
  const chartData = text[0];

  const arrayChartConfigs = configsAllCharts(chartData);

  res.render("view", {
    data: chartData,
    config: arrayChartConfigs,
    slideIndex: chartData.slideNum - 1,
  });
});

app.get("/genre", (req, res) => {
  const chartData = text[1];

  const arrayChartConfigs = configsAllCharts(chartData);

  res.render("view", {
    data: chartData,
    config: arrayChartConfigs,
    slideIndex: chartData.slideNum - 1,
  });
});

app.get("/box-office", (req, res) => {
  const chartData = text[2];

  const arrayChartConfigs = configsAllCharts(chartData);

  res.render("view", {
    data: chartData,
    config: arrayChartConfigs,
    slideIndex: chartData.slideNum - 1,
  });
});

app.get("/misc", (req, res) => {
  const chartData = text[3];

  const arrayChartConfigs = configsAllCharts(chartData);

  res.render("view", {
    data: chartData,
    config: arrayChartConfigs,
    slideIndex: chartData.slideNum - 1,
  });
});

app.get("/trends", (req, res) => {
  const chartData = text[4];

  const arrayChartConfigs = configsAllCharts(chartData);

  res.render("view", {
    data: chartData,
    config: arrayChartConfigs,
    slideIndex: chartData.slideNum - 1,
  });
});

app.get("/recent", (req, res) => {
  const chartData = text[5];

  const arrayChartConfigs = configsAllCharts(chartData);

  res.render("view", {
    data: chartData,
    config: arrayChartConfigs,
    slideIndex: chartData.slideNum - 1,
  });
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
