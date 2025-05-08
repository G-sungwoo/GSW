// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example

var ctx1 = document.getElementById("myPieChart1");
var myPieChart1 = new Chart(ctx1, {
  type: 'doughnut',
  data: {
    labels: ["현재취득학점", "필요취득학점"],
    datasets: [{
      data: [acqtPont, joedPont],
      backgroundColor: ['rgba(000, 000, 153, 0.7)','rgba(204, 204, 204, 0.3)'],
      hoverBackgroundColor: ["#FF6384","#36A2EB"],
    }],
  },
  options: {
	    plugins: {
		      doughnutlabel: {
		        labels: [
		          {
		            text: acqtPont+'/'+joedPont,
		            font: {
		              size: '25'
		            }
		          },
		          {
			        text: '취득학점/필요학점',
			        font: {
			          size: '15'
			        }
			      }
		        ]
		      }
		    },
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});


var ctx2 = document.getElementById("myPieChart2");
var myPieChart2 = new Chart(ctx2, {
  type: 'doughnut',
  data: {
	    labels: ["현재취득학점", "필요취득학점"],
    datasets: [{
      data: [gyotPont, gyedPont],
      backgroundColor: ['rgba(102, 102, 255, 0.7)','rgba(204, 204, 204, 0.3)'],
      hoverBackgroundColor: ["#FF6384","#36A2EB"],
    }],
  },
  options: {
	    plugins: {
		      doughnutlabel: {
		        labels: [
		          {
		            text: gyotPont+'/'+gyedPont,
		            font: {
		              size: '25'
		            }
		          },
		          {
				    text: '취득학점/필요학점',
				    font: {
				      size: '15'
				    }
				  }
		        ]
		      }
		    },
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

var ctx3 = document.getElementById("myPieChart3");
var myPieChart3 = new Chart(ctx3, {
  type: 'doughnut',
  data: {
	    labels: ["현재취득학점", "필요취득학점"],
    datasets: [{
      data: [juntPont, juedPont],
      backgroundColor: ['rgba(255, 153, 255, 0.7)','rgba(204, 204, 204, 0.3)'],
      hoverBackgroundColor: ["#FF6384","#36A2EB"],
    }],
  },
  options: {
	    plugins: {
		      doughnutlabel: {
		        labels: [
		          {
		            text: juntPont+'/'+juedPont,
		            font: {
		              size: '25'
		            }
		          },
		          {
				    text: '취득학점/필요학점',
				    font: {
				      size: '15'
				    }
				  }
		        ]
		      }
		    },
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

/*
기본 템플릿 js로 사용 가능한 소스(chart 분기 적용이 안되어 js 추가 처리 하고 주석)
Chart.pluginService.register({
	  beforeDraw: function(chart) {
	    var width = chart.chart.width,
	        height = chart.chart.height,
	        ctx = chart.chart.ctx;
	    ctx.restore();
	    var fontSize = (height / 114).toFixed(2);
	    ctx.font = fontSize + "em sans-serif";
	    ctx.textBaseline = "middle";
	    var text = "75%",
	        textX = Math.round((width - ctx.measureText(text).width) / 2),
	        textY = height / 2;
	    ctx.fillText(text, textX, textY);
	    ctx.save();
	  }
	});
*/