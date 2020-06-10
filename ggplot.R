# Starter ggplot function

plot_clicks <- function(ad_clicks, plot_type = "both", date_range){
    
    require(ggplot2)
    require(dplyr)
    
    start_date <- date_range[1]
    end_date <- date_range[2]
    
    plot_expr <- switch(plot_type,
                        scatter = ggplot2::geom_point(size = 4),
                        line = ggplot2::geom_line(size = 1.2),
                        both = list(ggplot2::geom_line(size = 1.2), 
                                    ggplot2::geom_point(size = 4))
    )
    
    ad_clicks %>% 
        filter(day > start_date, day < end_date) %>%
        dplyr::group_by(name, day) %>% 
        dplyr::summarise(clicks = sum(clicks)) %>% 
        dplyr::ungroup() %>% 
        ggplot2::ggplot(ggplot2::aes(x = day,
                                     y = clicks,
                                     col = name)) +
        plot_expr + 
        ggplot2::scale_x_date(date_breaks = "1 week",
                              date_labels = "%d%b%Y") + 
        ggplot2::labs(
            x = "",
            y = "",
            title = ""
        ) + 
        ggplot2::guides(col = ggplot2::guide_legend(title = "")) + 
        ggplot2::theme(
            legend.position = "bottom"
        )
    
}