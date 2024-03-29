#提示框组件,鼠标选中后展示的内容
tooltip_fun <- function(show=TRUE,trigger='axis',formatter=NULL){
  #axis显示系列之，item显示单项值
  paste("tooltip:",rjson::toJSON(list(show=show,trigger=trigger,formatter=formatter)),",",sep="")

}
#图例组件,图例组件展现了不同系列的标记(symbol)，颜色和名字。可以通过点击图例控制哪些系列不显示。
legend_fun <- function(data,orient='horizontal',x='center',y='top'){
  #orient,布局方式:horizontal为水平放置，vertical为垂直放置
  #x,水平安放位置:'center'为全图居中，可选为'center'|'left'|'right'|{..px}
  #y,垂直安放位置:'top'为全图顶端，可选为'top'|'bottom'|'center'|{..px}
  result <- paste("legend:",
                  rjson::toJSON(list(data=as.character(c(data,0)),orient=orient,x=x,y=y)),",",sep="")
  gsub("(,\"0\"])|(,0])","]",result)
}
#工具箱。内置有导出图片，数据视图，动态类型切换，数据区域缩放，重置五个工具。
toolbox_fun <- function(show="false",orient='vertical',magicType.type=c('line', 'bar')){
  paste("toolbox:",
        rjson::toJSON(list(show=show,
                           orient=orient,
                           feature=list(
                             restore=list(show="true"),
                             magicType=list(show="true",type=magicType.type),
                             saveAsImage=list(show="true")
                           )
        )),",",sep="")
}
#直角坐标系的X轴
xAxis_fun <- function(data,type="category",boundaryGap='false',position="bottom"){
  result <- paste("xAxis:",
                  rjson::toJSON(list(list(type=type,boundaryGap=boundaryGap,position=position,
                                          data=as.character(c(data,0))
                                          )
                                     )
                                ),",",sep="")
  gsub("(,\"0\"])|(,0])","]",result)
  }
#直角坐标系的y轴
yAxis_fun <- function(type="value",position="left"){
  paste("yAxis:",
        rjson::toJSON(list(list(type=type,position=position)))
        ,",",sep="")
}
