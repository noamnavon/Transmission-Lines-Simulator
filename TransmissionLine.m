classdef TransmissionLine
    properties
        Coordinate (1,:) double
        Inductance (1,:) double
        Capacitance (1,:) double
        Impedance (1,:) double
        Admitance (1,:) double
        PhaseVelocity (1,:) double
    end
    
    methods
        function obj = TransmissionLine(space,L,C)
            obj.Coordinate = space;
            obj.Inductance = L;
            obj.Capacitance = C;
            obj.Impedance = sqrt((obj.Inductance)./(obj.Capacitance));
            obj.Admitance = 1./obj.Impedance;
            obj.PhaseVelocity = 1./sqrt((obj.Inductance).*(obj.Capacitance));
        end
        
        function [time, resultV, resultI] = CalcWavesInfTL(obj, V, I, T)
            dz = [obj.Coordinate(1) diff(obj.Coordinate)];
            dt = min(dz)/max(obj.PhaseVelocity);
            time = dt*(0:T-1);
        
            resultV = [V; zeros(T-1,length(V))];
            resultI = [I; zeros(T-1,length(I))];
            
            for t=2:T
                I = I+obj.Admitance.*(((obj.PhaseVelocity).*dt)./dz).*([0 V(1:end-1)] - V);
                V = V+obj.Impedance.*(((obj.PhaseVelocity).*dt)./dz).*(I - [I(2:end) 0]);
                V(1)=0;
                V(end)=0;
        
                resultV(t,:) = V;
                resultI(t,:) = I;
            end
        end
    end
end