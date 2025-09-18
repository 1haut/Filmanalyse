import { readFileSync } from "node:fs";

export async function loadCSV(path) {
  // const response = await fetch(path);
  // const text = await response.text();

  const text = readFileSync(path, { encoding: "utf-8" });

  const rows = text.trim().split("\n");

  const headerRow = rows.shift();

  const titles = headerRow.replace(/"/g, "").split(",").slice(1);

  const labels = [];
  const data = [];

  rows.forEach((row) => {
    const [label, ...values] = row.replace(/"/g, "").split(",");
    labels.push(label);

    values.forEach((val, i) => {
      data[i] = [...(data[i] ?? []), Number(val)];
    });
  });

  return [labels, data, titles];
}

export const colorWheel = [
  "#003a7d",
  "#008dff",
  "#ff73b6",
  "#c701ff",
  "#4ecb8d",
  "#ff9d3a",
  "#f9e858",
  "#d83034",
  "#8c8c8c",
  "#000000",
  "#7b5e7b",
  "#ffb3ff",
  "#aaffc3",
  "#ffffb3",
  "#ff6666",
  "#808080",
];
