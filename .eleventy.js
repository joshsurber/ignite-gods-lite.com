module.exports = function (eleventyConfig) {
  eleventyConfig.addPassthroughCopy("img");
  eleventyConfig.addPassthroughCopy("*.js");
  eleventyConfig.addPassthroughCopy("*.css");

  eleventyConfig.setBrowserSyncConfig({
    open: true,
  });

  eleventyConfig.addShortcode("year", () => `${new Date().getFullYear()}`);
};
