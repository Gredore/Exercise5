clear all
OUT = [];
Total_count = 1;
for a = [0.25 0.375 0.5 0.75 0.875 1 1.25 1.5]
    for b = [8 10 12 16 20]
        for c = [0.109 0.083 0.065 0.049 0.035]
            c = a - 2*c;
            d = 1.25;
            e = 400;
            for count1 = 1:1:5
                fs = [1 2 4 6 8];
                gs = [0.319 0.249 0.175 0.0743 0.0365];
                hs = [2.142 2.207 2.285 2.499 2.675];
                
                f = fs(count1);
                g = gs(count1);
                h = hs(count1);
                
                for i = [0.2 0.3 0.4 0.5 0.6]
                    for j = [15 25 35 45]
                        k = 1; %Gets set in main.m
                        l = 1.5;
                        m = 0.254;
                        n = 0.2032;
                        for count2 = 1:1:3
                            os = [16.7 10 8.3];
                            ps = [6 10 22];
                            qs = [14.6 109 11.4];
                            rs = [7900 8500 4500];
                            ss = [200 110 103];
                            o = os(count2);
                            p = ps(count2);
                            q = qs(count2);
                            r = rs(count2);
                            s = ss(count2);
                            t = 18.3;
                            u = 0.8;
                            v = 7800;
                            w = 160;
                            x = 4.24 * 10^6;
                            y = 26.407;
                            z = 67.46;
                            aa = Total_count;
                            Total_count = Total_count + 1;
                            OUT = [OUT ; [a b c d e f g h i j k l m n o p q r s t u v w x y z aa]];
                            if mod(length(OUT), 10000) ==0
                                length(OUT)
                            end
                        end
                    end
                end
            end
        end
    end
end