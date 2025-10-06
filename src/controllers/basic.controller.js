import { pageInfo } from "../utils/pageInfo.js";
import { configsAllCharts, kebabCaseConverter } from "../utils/functions.js";

export const basic = (req, res) => {
  const chartData = pageInfo[0];

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
