function AnimateDist(time, space ,resultV, resultI, skips)

    for t=1:length(time)
        if mod(t,skips+1) == 0
            subplot(2,1,1)
            plot(space ,resultI(t,:),Color="r")
            txt = {'Time:' time(t)-time(2)/2};
            text('Units', 'normalized', 'Position', [0.01, 0.98], ...
                 'String', txt, 'VerticalAlignment', 'top', ...
                 'HorizontalAlignment', 'left'); 
            ylim([-1.5 1.5])
            ylabel("I[A]")
            xlim([0 space(end)])
            xlabel("z(m)")
            drawnow;            

            subplot(2,1,2)
            plot(space+space(1)/2 ,resultV(t,:),Color="b")
            txt = {'Time:' time(t)};
            text('Units', 'normalized', 'Position', [0.01, 0.98], ...
                 'String', txt, 'VerticalAlignment', 'top', ...
                 'HorizontalAlignment', 'left'); 
            ylim([-1.5 1.5])
            ylabel("V[V]")
            xlim([0 space(end)])
            xlabel("z(m)")
            drawnow;
        end
    end
end