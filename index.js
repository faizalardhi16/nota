const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.status(200).json({
    status: 200,
    message: "Success",
    data: ["Ayam", "Kambing"],
  });
});

app.listen(3000, () => {
  console.log("App listen on port 3000 LOL");
});
