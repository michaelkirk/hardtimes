var VisitorPieChart = function(data) {
  this.render(data);
}

VisitorPieChart.prototype.render = function(data) {
  var r = Raphael("chart"),
  pie = r.piechart(200, 200, 100, _.values(data), { legend: _.keys(data), legendpos: "west"});

  r.text(320, 100, "Visit Frequency").attr({ font: "20px sans-serif" });
  pie.hover(function () {
    this.sector.stop();
    this.sector.scale(1.1, 1.1, this.cx, this.cy);

    if (this.label) {
      this.label[0].stop();
      this.label[0].attr({ r: 7.5 });
      this.label[1].attr({ "font-weight": 800 });
    }
  }, function () {
    this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

    if (this.label) {
      this.label[0].animate({ r: 5 }, 500, "bounce");
      this.label[1].attr({ "font-weight": 400 });
    }
  });
}

VisitorPieChart.prototype.visitsUrl = function(visitorName) {
  return "/visits?id=" + visitorName;
}



