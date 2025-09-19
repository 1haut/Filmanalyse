import { colorWheel } from "./utilities.js";

// Chart.js chart configurations
export const barChart = {
  type: "bar",
  data: {
    labels: [],
    datasets: [
      {
        label: "Default",
        backgroundColor: colorWheel[1],
        borderWidth: 1,
      },
    ],
  },
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: true,
      },
    },
  },
};

export const lineChart = {
  type: "line",
  data: {
    labels: [],
    datasets: [
      {
        label: "Default",
        data: [],
        fill: false,
        borderColor: "#4bc0c0ff",
        tension: 0.1,
      },
    ],
  },
};

export const pieChart = {
  type: "pie",
  data: {
    labels: [],
    datasets: [
      {
        label: "Default",
        data: [],
        backgroundColor: colorWheel,
        borderColor: colorWheel.map((color, index) => {
          return colorWheel[(index + 3) % colorWheel.length];
        }),
        borderWidth: 1,
      },
    ],
  },
};

export const scatterChart = {
  type: "scatter",
  data: {
    datasets: [
      {
        label: "",
        data: [
          {
            x: 0,
            y: 0,
          },
          {
            x: 0,
            y: 0,
          },
        ],
        backgroundColor: "#20a924ff",
      },
    ],
  },
  options: {
    scales: {
      x: {
        type: "linear",
        position: "bottom",
      },
    },
  },
};

export const doughnutChart = {
  type: "doughnut",
  data: {
    labels: [],
    datasets: [
      {
        label: "Default",
        data: [],
        backgroundColor: colorWheel,
        hoverOffset: 4,
      },
    ],
  },
  options: {
    responsive: true,
  },
};
