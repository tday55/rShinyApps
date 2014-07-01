shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    if (input$n_breaks == '') bks = 20
    if (input$n_breaks != '') bks = as.numeric(input$n_breaks)
    hist(faithful$eruptions,
      probability = TRUE,
      breaks = bks, #as.numeric(input$n_breaks),
      xlab = "Duration (minutes)",
      main = "Geyser eruption duration")

    if (input$individual_obs) {
      rug(faithful$eruptions)
    }

    if (input$density) {
      dens <- density(faithful$eruptions,
          adjust = input$bw_adjust)
      lines(dens, col = "blue")
    }

  })
})