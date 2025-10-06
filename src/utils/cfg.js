export const colorWheel = [
  "#003a7d",
  "#0099de",
  "#ff73b6",
  "#c701ff",
  "#4ecb8d",
  "#ff9d3a",
  "#f9e858",
  "#d83034",
  "#8c8c8c",
  "#7b5e7b",
  "#ffb3ff",
  "#4bc0c0ff",
  "#ffffb3",
  "#ff6666",
  "#808080",
];

// Chart.js chart defaults configurations
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
        label: "My First Dataset",
        fill: false,
        borderColor: colorWheel,
        tension: 0.1,
      },
    ],
  },
  options: {
    elements: {
      point: {
        radius: 0,
      },
    },
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
    datasets: [],
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

export const chartConfigObj = {
  bar: barChart,
  line: lineChart,
  pie: pieChart,
  doughnut: doughnutChart,
  scatter: scatterChart,
};
