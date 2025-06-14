const scrapeSite = require('./scrapeTemplate');

const extractGogo = ($) => {
  const articles = [];
  $('div.top-news div.news').each((_, el) => {
    const title = $(el).find('a').text().trim();
    const link = $(el).find('a').attr('href');
    if (title && link) {
      articles.push({ title, link });
    }
  });
  return articles;
};

scrapeSite('https://gogo.mn/', extractGogo);