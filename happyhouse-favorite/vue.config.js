const path = require("path");
module.exports = {
  outputDir: path.resolve(
    __dirname,
    "../src/main/resources/static/favoritejs"
  ),
  filenameHashing: false,
  configureWebpack: (config) => {
    if (process.env.NODE_ENV === "prod") {
      config.output.filename = "/js/[name].js";
      config.output.chunkFilename = "/js/[name].js";
    }
  },
};
