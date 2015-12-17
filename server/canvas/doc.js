var Canvas = require('canvas'),
        d3 = require('d3'),
         _ = require('lodash');

module.exports.scatterplot = function(rows, cvswidth, cvsheight) {
  // Default canvas sizes
  cvswidth  = cvswidth || 800;
  cvsheight = cvsheight || cvswidth || 800;

  var canvas = new Canvas(cvswidth, cvsheight);
  var ctx = canvas.getContext('2d');
  // Fill background
  // ctx.fillStyle = '#121119';
  // ctx.fillRect(0, 0, cvswidth, cvsheight);

  var max_living_space = _.max(rows, 'living_space').living_space;
  var max_total_rent   = _.max(rows, 'total_rent').total_rent;
  // Create scale for x (living_space)
  var x = d3.scale.linear().domain([0, max_living_space]).range([0, cvswidth]);
  // Create scale for y (total_rent)
  var y = d3.scale.linear().domain([0, max_total_rent]).range([cvsheight, 0]);
  // Transparent image to allow
  ctx.globalAlpha = .7
  // Points color
  ctx.fillStyle = "#D35F5F";

  for(var r in rows) {
    var row = rows[r];
    ctx.fillRect( x(row.living_space), y(row.total_rent), 1, 1);
  }

  return canvas;
};