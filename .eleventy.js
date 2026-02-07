const Image = require("@11ty/eleventy-img");
const path = require("path");

// Shortcode per immagini ottimizzate
async function imageShortcode(src, alt, sizes = "100vw", classes = "", loading = "lazy", fetchpriority = "") {
  let inputPath = src;

  // Se il path inizia con /, è relativo a src/
  if (src.startsWith("/")) {
    inputPath = path.join("src", src);
  }

  let metadata = await Image(inputPath, {
    widths: [400, 800, 1200, 1600],
    formats: ["webp", "jpeg"],
    outputDir: "./_site/assets/images/optimized/",
    urlPath: "/assets/images/optimized/",
    filenameFormat: function (id, src, width, format) {
      const name = path.basename(src, path.extname(src));
      return `${name}-${width}w.${format}`;
    }
  });

  let imageAttributes = {
    alt,
    sizes,
    loading,
    decoding: loading === "eager" ? "sync" : "async",
    class: classes
  };

  if (fetchpriority) {
    imageAttributes.fetchpriority = fetchpriority;
  }

  return Image.generateHTML(metadata, imageAttributes);
}

module.exports = function(eleventyConfig) {
  // Shortcode immagini ottimizzate
  eleventyConfig.addNunjucksAsyncShortcode("image", imageShortcode);

  // Copia assets statici
  eleventyConfig.addPassthroughCopy("src/assets");
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/robots.txt");
  eleventyConfig.addPassthroughCopy("src/.htaccess");
  eleventyConfig.addPassthroughCopy("src/googlee414e0b07a93e556.html");

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
