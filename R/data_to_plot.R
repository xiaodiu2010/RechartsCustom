data_to_plot_fun <- function(id,data,height='400px',width='600px'){
  to_plot <-tags$div(id=id,style=paste("height:",height,";width:",width,";",sep=""),
                     tags$script(type="text/javascript",paste("
                       var myChart = echarts.init(document.getElementById('",id,"'),'macarons');
                       var option = {",data,"};
                       myChart.setOption(option);",sep=""))
  )
  return(to_plot)
}
