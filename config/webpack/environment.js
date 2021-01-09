const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',//$に格納
    jQuery: 'jquery/src/jquery',
    Popper: "popper.js"
  })
)
module.exports = environment