$(function () {
    $('#container5').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'listing of all hashtags created during the given datetime '
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'dates(Nov)'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'created on: <b>{point.y} Nov</b>'
        },
        series: [{
            name: 'Population',
            data: [
                ['iphone', 25],
                ['Deal', 25],
                ['iphone6s', 26],
                ['gold', 21],
                ['rosegold', 12],
                ['MNP', 12.1],
                ['Apple', 11.8],
                ['Appleceo', 11.7],
                
            ],
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                 // one decimal
                y: 10, // 10 pixels down from the top
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });
});