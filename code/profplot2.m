function h = profplot2(x, y, x_label, y_label, title_str, legend_vec, pdf_name)

    set(0, 'DefaultTextInterpreter', 'latex')
    set(0, 'DefaultLegendInterpreter', 'latex')
    set(0, 'DefaultAxesTickLabelInterpreter', 'latex')
    
    lw = 2;
    %h = figure();
    h = figure('Renderer', 'painters', 'Position', [10 10 900 350]);
    removeToolbarExplorationButtons(h)

    plot(x, y, 'Linewidth', lw);
    xlim([x(1) x(end)])
    
    xlabel(x_label)
    ylabel(y_label)

    set(gcf,'color','w');
    set(gca, 'FontSize',16);
    grid on
    box on
    legend(legend_vec)
    title(title_str)
    exportgraphics(h, pdf_name);

end

