module.exports = function(eleventyConfig) {
  // Copia assets statici
  eleventyConfig.addPassthroughCopy("src/assets");
  eleventyConfig.addPassthroughCopy("src/css");

  // Watch CSS
  eleventyConfig.addWatchTarget("src/css/");

  // Filtro per lingua
  eleventyConfig.addFilter("filterByLang", function(collection, lang) {
    return collection.filter(item => item.data.lang === lang);
  });

  // Collezioni per lingua
  eleventyConfig.addCollection("it", function(collectionApi) {
    return collectionApi.getAll().filter(item => item.data.lang === "it");
  });

  eleventyConfig.addCollection("en", function(collectionApi) {
    return collectionApi.getAll().filter(item => item.data.lang === "en");
  });

  eleventyConfig.addCollection("de", function(collectionApi) {
    return collectionApi.getAll().filter(item => item.data.lang === "de");
  });

  return {
    dir: {
      input: "src",
      output: "_site",
      includes: "_includes",
      layouts: "_layouts",
      data: "_data"
    },
    templateFormats: ["md", "njk", "html"],
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk"
  };
};
