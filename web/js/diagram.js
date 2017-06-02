/**
 * Created by xinna on 2017/5/9.
 */
var dataline=[];
//var datacoworker = [{coworker:'中国',times:96},{coworker:'德国',times:121},{coworker:'美国',times:100},{coworker:'日本',times:111},{coworker:'韩国',times:102},{coworker:'法国',times:124},{coworker:'意大利',times:123},{coworker:'荷兰',times:111},{coworker:'比利时',times:123},{coworker:'英国',times:109},{coworker:'加拿大',times:115},{coworker:'俄罗斯',times:99},{coworker:'墨西哥',times:91},{coworker:'印度',times:87},{coworker:'瑞士',times:125},{coworker:'澳大利亚',times:130},{coworker:'西班牙',times:109},{coworker:'巴西',times:123},{coworker:'泰国',times:91},{coworker:'印尼',times:83},{coworker:'波兰',times:101},{coworker:'瑞典',times:116},{coworker:'奥地利',times:111},{coworker:'捷克',times:107}];
var datacoworker = [];
//var datatree = [{"name":"flare","children":[{"name":"analytics","children":[{"name":"cluster","children":[{"name":"AgglomerativeCluster","size":3938},{"name":"CommunityStructure","size":3812},{"name":"HierarchicalCluster","size":6714},{"name":"MergeEdge","size":743}]},{"name":"graph","children":[{"name":"BetweennessCentrality","size":3534},{"name":"LinkDistance","size":5731},{"name":"MaxFlowMinCut","size":7840},{"name":"ShortestPaths","size":5914},{"name":"SpanningTree","size":3416}]},{"name":"optimization","children":[{"name":"AspectRatioBanker","size":7074}]}]},{"name":"animate","children":[{"name":"Easing","size":17010},{"name":"FunctionSequence","size":5842},{"name":"interpolate","children":[{"name":"ArrayInterpolator","size":1983},{"name":"ColorInterpolator","size":2047},{"name":"DateInterpolator","size":1375},{"name":"Interpolator","size":8746},{"name":"MatrixInterpolator","size":2202},{"name":"NumberInterpolator","size":1382},{"name":"ObjectInterpolator","size":1629},{"name":"PointInterpolator","size":1675},{"name":"RectangleInterpolator","size":2042}]},{"name":"ISchedulable","size":1041},{"name":"Parallel","size":5176},{"name":"Pause","size":449},{"name":"Scheduler","size":5593},{"name":"Sequence","size":5534},{"name":"Transition","size":9201},{"name":"Transitioner","size":19975},{"name":"TransitionEvent","size":1116},{"name":"Tween","size":6006}]}]}];
var datatree = [];
var data_teacher = [];
var advisee1=$("#my_advisee_id").text();
var advisee2=$("#advisee1").text();

$(function() {
    $.ajax({
        url:"/relationwebdemo/ScholarServlet",//要请求的servlet
        data:{method:"getAjaxDetail", advisee_id:parseInt(advisee1)},//给服务器的参数
        type:"GET",
        dataType:"json",
        async:true,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
        cache:false,
        success:function(result) {
            if(result) {//如果校验失败
                //paper--------------------------------------------------------------------------

                for(var i=0;i<result[0].length;i++){
                    dataline[i]={year:result[0][i].year,number:result[0][i].number};
                }
                var chart = new G2.Chart({
                    id: 'paperNum',
                    forceFit: true,
                    height: 250
                });
                chart.source(dataline,{
                    year: {
                        alias: 'YEAR',
                        range: [0, 1],
                        fill: '#cecece', // 文本的颜色
                        fontSize: '12', // 文本大小
                        fontWeight: 'normal', // 文本粗细
                    },
                    number: {
                        alias: 'PAPER NUMBER',
                        fill: '#cecece', // 文本的颜色
                        fontSize: '12', // 文本大小
                        fontWeight: 'normal', // 文本粗细
                    }
                });
                chart.axis('year', {
                    labels: {
                        //autoRotate: true | false, // 文本是否允许自动旋转
                        label: {
                            textAlign: 'center', // 文本对齐方向，可取值为： left center right
                            fill: '#cecece', // 文本的颜色
                            fontSize: '12', // 文本大小
                            fontWeight: 'normal', // 文本粗细
                            //rotate: 30 // 文本旋转角度
                        }
                    }
                });
                chart.axis('number', {
                    labels: {
                        //autoRotate: true | false, // 文本是否允许自动旋转
                        label: {
                            textAlign: 'center', // 文本对齐方向，可取值为： left center right
                            fill: '#cecece', // 文本的颜色
                            fontSize: '12', // 文本大小
                            fontWeight: 'normal', // 文本粗细
                            //rotate: 30 // 文本旋转角度
                        }
                    }
                });
                chart.tooltip(true, {
                    custom: true, // 使用自定义的 tooltip
                    offset: 10,
                    customFollow: true
                });
                chart.line().position('year*number').color('#4bffd5').size(2);
                chart.render();
                //paper--------------------------------------------------------------------------

                //col_cop--------------------------------------------------------------------------
                for(var i=0;i<result[2].length;i++){
                    datacoworker[i]={coworker:result[2][i].coworker,times:result[2][i].times};
                }
                var chart = new G2.Chart({
                    id: 'coworker',
                    forceFit: true,
                    height: 450,
                    plotCfg: {
                        margin: [35, 140, 35, 0]
                    }
                });
                chart.source(datacoworker, {
                    'times': {
                        min: 0
                    }
                });
                chart.coord('polar');
                chart.axis('times', {
                    labels: null
                });
                chart.axis('coworker', {
                    gridAlign: 'middle',
                    labelOffset: 10,
                    labels: {
                        label: {
                            textAlign: 'center',// 设置坐标轴 label 的文本对齐方向
                            fill: '#cecece', // 文本的颜色
                            fontSize: '12', // 文本大小
                            fontWeight: 'normal', // 文本粗细
                        }
                    }
                });
                chart.legend(false);
                /*chart.legend('coworker', {
                 itemWrap: true // 图例换行，将该参数设置为 true, 默认为 false，不换行。

                 });*/
                chart.tooltip(true, {
                    custom: true, // 使用自定义的 tooltip
                    offset: 10
                });
                chart.interval().position('coworker*times')
                    .color('coworker','rgb(252,143,72)-rgb(255,215,135)')
                    .label('times',{offset: -15,label: {textAlign: 'center', fontWeight: 'bold'}})
                    .style({
                        lineWidth: 1,
                        stroke: '#fff'
                    });
                chart.render();
                //col_cop--------------------------------------------------------------------------


                //teacher_cop--------------------------------------------------------------------------
                var index=0;
                data_teacher[0]={year:"",number:""};
                for(index=1;index<result[1].length+1;index++){
                    data_teacher[index]={year:result[1][index-1].year,number:result[1][index-1].number};
                }
                data_teacher[index]={year:"",number:""};

                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id : 'teac_time',
                    forceFit: true,
                    height: 450
                });
                var Frame = G2.Frame;
                var frame = new Frame(data_teacher);
                frame = Frame.sort(frame, 'release');
                chart.source(frame, {
                    year: {
                        alias: 'year',
                        range: [0, 1],
                        fill: '#cecece', // 文本的颜色
                        fontSize: '12', // 文本大小
                        fontWeight: 'normal' // 文本粗细
                    },
                    number: {
                        alias: 'times',
                        fill: '#cecece', // 文本的颜色
                        fontSize: '12', // 文本大小
                        fontWeight: 'normal' // 文本粗细

                    }
                });
                chart.axis('year', {
                    labels: {
                        //autoRotate: true | false, // 文本是否允许自动旋转
                        label: {
                            textAlign: 'center', // 文本对齐方向，可取值为： left center right
                            fill: '#cecece', // 文本的颜色
                            fontSize: '12', // 文本大小
                            fontWeight: 'normal' // 文本粗细
                            //rotate: 30 // 文本旋转角度
                        }
                    }
                });
                chart.axis('number', {
                    labels: {
                        //autoRotate: true | false, // 文本是否允许自动旋转
                        label: {
                            textAlign: 'center', // 文本对齐方向，可取值为： left center right
                            fill: '#cecece', // 文本的颜色
                            fontSize: '12', // 文本大小
                            fontWeight: 'normal'// 文本粗细
                            //rotate: 30 // 文本旋转角度
                        }
                    }
                });
                chart.interval().position('year*number').color('#de00da');
                chart.render();
                //teacher_cop--------------------------------------------------------------------------


                return true;
            }
        }
    });

    $.ajax({
        url:"/relationwebdemo/ScholarServlet",//要请求的servlet
        data:{method:"getAjaxTreeJson", advisee:advisee2,advisee_id:parseInt(advisee1)},//给服务器的参数
        type:"GET",
        dataType:"json",
        async:true,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
        cache:false,
        success:function(result) {
            if(result) {//如果校验
                datatree[0]=result;
                //teacher-student tree

                var Layout = G2.Layout;
                var Stat = G2.Stat;
                var chart = new G2.Chart({
                    id: 'tree',
                    forceFit: true,
                    height: 450,
                    plotCfg: {
                        margin: [20,50]
                    }
                });

// 不显示title
                chart.tooltip(true,{
                    custom: true,
                    offset:10,
                    title: null
                });

// 不显示图例
                chart.legend(false);
// 使用layout，用户可以自己编写自己的layout
// 仅约定输出的节点 存在 id,x，y字段即可
                var layout = new Layout.Tree({
                    nodes: datatree
                });
                var nodes = layout.getNodes();
                var edges = layout.getEdges();

// 首先绘制 edges，点要在边的上面
// 创建单独的视图
                var edgeView = chart.createView();
                edgeView.source(edges);
                edgeView.coord().transpose(); //
                edgeView.axis(false);
                edgeView.tooltip(false);
// Stat.link 方法会生成 ..x, ..y的字段类型，数值范围是 0-1
                edgeView.edge()
                    .position(Stat.link('source*target',nodes))
                    .shape('smooth')
                    .color('#a8a8a8');

// 创建节点视图
                var nodeView = chart.createView();
                nodeView.coord().transpose(); //'polar'
                nodeView.axis(false);

// 节点的x,y范围是 0，1
// 因为边的范围也是 0,1所以正好统一起来
                nodeView.source(nodes, {
                    x: {min: 0,max:1},
                    y: {min: 0, max:1},
                    value: {min: 0}
                });

                nodeView.point().position('x*y').color('blue').size(3).label('name', {
                    offset: 5,
                    labelEmit: true,
                    fill: '#fff', // 文本的颜色
                    fontSize: '12', // 文本大小
                    fontWeight: 'bold', // 文本粗细
                })
                    .tooltip('name');
                chart.render();
                return true;
            }
        }
    });

//srudent_times
    var datastu = [
        {student_name: '问题 33331', number:2,percent: 0},
        {student_name: '问题 2', number:2,percent: 0},
        {student_name: '问题 3', number:4,percent: 0},
        {student_name: '问题 4', number:5,percent: 0},
        {student_name: '问题 5', number:6,percent: 0},
        {student_name: '问题 6', number:6,percent: 0},
        {student_name: '问题 7', number:8,percent: 0},
        {student_name: '问题 8', number:9,percent: 0}
    ];
    var max=datastu[0].number;
    for(var i=0;i<datastu.length;i++)
    {
        if(max<datastu[i].number)
            max=datastu[i].number;
    }
    max=max+2;
    for(var i=0;i<datastu.length;i++)
    {
        //data[i].percent=(data[i].number/max).toFixed(1);
        datastu[i].percent=datastu[i].number/max;
    }
    var Frame = G2.Frame;
    var frame = new Frame(datastu); // 加工数据
    frame.addCol('odd',function(obj,index){
        return index % 2;
    });

    var chart = new G2.Chart({
        id: 'student',
        forceFit: true,
        height: 450
    });
    var defs = {
        'percent': {min: 0,max: 1},
        'odd': {type: 'cat'}
    };
    chart.source(frame,defs);
    chart.tooltip(true,{
        custom: true,
        map: {
            value: 'number',
            name: 'Number of cooperation',
            title: 'student_name'
        }
    });
    chart.legend(false);
    chart.coord('polar',{inner: 0.1}).transpose();
    chart.interval().position('student_name*percent')
        .color('odd',function(value){
            return ['rgb(224,74,116)', 'rgb(211,0,57)'][value];
        })
        .label('number',{offset: -5});

    frame.each(function(obj){
        chart.guide().text([obj.student_name,0],obj.student_name + ' ',{
            textAlign: 'right',
            fill: '#cecece', // 文本的颜色
            fontSize: '12', // 文本大小
            fontWeight: 'normal', // 文本粗细
        });
    });
    chart.render();

//year-paperNumber

});
//net graph-----------------------------------------------
var width = 400;
var height = 400;
var svg = d3.select(".web")
    .append("svg")
    .attr("width",width)
    .attr("height",height);
var color = d3.scaleOrdinal(d3.schemeCategory20);

var simulation = d3.forceSimulation()
    .force("link", d3.forceLink().id(function(d) { return d.id; }))
    .force("charge", d3.forceManyBody())
    .force("center", d3.forceCenter(width / 2, height / 2));

d3.json("/relationwebdemo/ScholarServlet?method=getAjaxNetJson&advisee="+advisee2+"&advisee_id="+parseInt(advisee1), function(error, graph) {
    if (error) throw error;
    var link = svg.append("g")
        .attr("class", "links")
        .selectAll("line")
        .data(graph.links)
        .enter().append("line")
        .attr("stroke-width", function(d) { return Math.sqrt(d.value); });

    var node = svg.append("g")
        .attr("class", "nodes")
        .selectAll("circle")
        .data(graph.nodes)
        .enter().append("circle")
        .attr("r", 5)
        .attr("fill", function(d) { return color(d.group); })
        .call(d3.drag()
            .on("start", dragstarted)
            .on("drag", dragged)
            .on("end", dragended));

    node.append("title")
        .text(function(d) { return d.id; });

    simulation
        .nodes(graph.nodes)
        .on("tick", ticked);

    simulation.force("link")
        .links(graph.links);

    function ticked() {
        link
            .attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

        node
            .attr("cx", function(d) { return d.x; })
            .attr("cy", function(d) { return d.y; });
    }
});

function dragstarted(d) {
    if (!d3.event.active) simulation.alphaTarget(0.3).restart();
    d.fx = d.x;
    d.fy = d.y;
}

function dragged(d) {
    d.fx = d3.event.x;
    d.fy = d3.event.y;
}

function dragended(d) {
    if (!d3.event.active) simulation.alphaTarget(0);
    d.fx = null;
    d.fy = null;
}
//net graph--------------------------------------------
//coworker_times

//柱 学者和老师的合作情况

