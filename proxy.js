module.exports = [
    {
        pattern: /(?:.*?\.)?foody\.example\/(?:[a-z]{2}(?:-[A-Z]{2,3})?\/)?(.*)/,
        responder: "http://localhost:4050/$1"
    }
];