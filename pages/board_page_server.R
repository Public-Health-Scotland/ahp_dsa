
####################### Boards Page - SERVER #######################



filtered_data <- reactive({
  Join_all_long2 %>%
    filter(`NHS Board` == input$board) %>%
    filter(Specialty == input$specialty)
})



#waiting-list_chart


output$waiting_list_chart <- renderPlot({
    ggplot(data = filtered_data(),
         aes(x = `Month/Year`, y = Value, group = Indicator)) +
    geom_line(aes(colour= Indicator), size=1.2) +
    theme_bw() +
    theme(legend.text = element_text(size = 12)) +
    theme(legend.position="bottom") +
    theme(legend.title=element_blank()) +
    theme(axis.text=element_text(size=12),axis.title=element_text(size=12)) +
    # scale_x_date(date_labels = "%b %y", breaks = as.Date(c("2019-01-01", "2019-04-01",
    #                                                        "2019-07-01", "2019-10-01",
    scale_x_date(date_labels = "%b %y", breaks = as.Date(c("2020-01-01", "2020-04-01",
                                                           "2020-07-01", "2020-10-01",
                                                           "2021-01-01", "2021-04-01",
                                                           "2021-07-01", "2021-10-01",
                                                           "2022-01-01", "2022-04-01",
                                                           "2022-07-01", "2022-10-01",
                                                           "2023-01-01", "2023-04-01")))+
    scale_color_manual(values=c('#2F5597','#5B9BD5','#00B0F0','#1F4E79')) +
    ylab(NULL) +
    xlab(NULL) +
    theme(plot.title.position = "panel") +
    scale_y_continuous (breaks=seq (0,80000,by=1000),
                        labels=function(x) format(x, big.mark = ",", scientific = FALSE))
})

