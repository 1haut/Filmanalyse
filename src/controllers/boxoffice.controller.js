import { pageInfo } from "../utils/pageInfo.js";
import { configsAllCharts, kebabCaseConverter } from "../utils/functions.js";

export const boxOffice = (req, res) => {
  const chartData = pageInfo[3];

  const headlines = pageInfo.map(page => page.headline);

  const arrayChartConfigs = configsAllCharts(chartData);

  res.render("view", {
    data: chartData,
    config: arrayChartConfigs,
    slideIndex: chartData.slideNum - 1,
    pageHeadlines: headlines,
    toKebabCase: kebabCaseConverter,
  });
};
