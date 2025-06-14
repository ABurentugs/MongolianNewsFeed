const axios = require('axios');
const cheerio = require('cheerio');

const scrapeSite = async (url, extractFn) => {
  try {
    const { data } = await axios.get(url);
    const $ = cheerio.load(data);
    const articles = extractFn($);
    console.log(articles);
  } catch (err) {
    console.error('Error scraping', url, err.message);
  }
};

module.exports = scrapeSite;