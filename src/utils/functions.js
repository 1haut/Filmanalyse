import { readFileSync } from "node:fs";
import { chartConfigObj } from "./cfg.js";

export function loadCSV(path) {
  const filePath = "data/csv/" + path;
  const text = readFileSync(filePath, { encoding: "utf-8" });

  const rows = text.trim().split("\n");

  const headerRow = rows.shift();

  const titles = headerRow.replace(/"/g, "").split(",").slice(1);

  const labels = [];
  const data = [];

  rows.forEach(row => {
    const [label, ...values] = row.replace(/"/g, "").split(",");
    labels.push(label);

    values.forEach((val, i) => {
      data[i] = [...(data[i] ?? []), Number(val)];
    });
  });

  return [labels, data, titles];
}

export function setConfigs(type, csv) {
  const [labels, values, titles] = csv;
  const config = structuredClone(chartConfigObj[type]);
  switch (type) {
    case "scatter":
      const [xValues, yValues] = values;
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
        const newData = structuredClone(config.data.datasets[0]);
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

export function configsAllCharts(chartData) {
  return chartData.titles.map((el, i) => {
    const resData = loadCSV(chartData.paths[i]);
    const chartConfigs = setConfigs(chartData.chartTypes[i], resData);

    return chartConfigs;
  });
}

export function kebabCaseConverter(string) {
  return string
    .match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g)
    .join("-")
    .toLowerCase();
}
