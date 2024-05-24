function PlotTransient(time, space ,resultV, resultI, probeLoc)

    plotAmount = length(probeLoc);
    
    for plotNum = 1:plotAmount
        subplot(2,plotAmount,plotNum)
        plot(time-time(2)/2 ,resultI(:,probeLoc(plotNum)),Color="r")
        txt = {'Space:' space(probeLoc(plotNum))};
        text('Units', 'normalized', 'Position', [0.01, 0.98], ...
             'String', txt, 'VerticalAlignment', 'top', ...
             'HorizontalAlignment', 'left');   
        ylim([-0.5 0.5])
        ylabel("I[A]")
        xlim([0 time(end)])
        xlabel("t(s)")
        drawnow;            
    
        subplot(2,plotAmount,plotAmount + plotNum)
        plot(time ,resultV(:,probeLoc(plotNum)),Color="b")
        txt = {'Space:' space(probeLoc(plotNum)) + space(1)/2};
        text('Units', 'normalized', 'Position', [0.01, 0.98], ...
             'String', txt, 'VerticalAlignment', 'top', ...
             'HorizontalAlignment', 'left');        
        ylim([-0.5 0.5])
        ylabel("V[V]")
        xlim([0 time(end)])
        xlabel("t(s)")
        drawnow;
    end

end