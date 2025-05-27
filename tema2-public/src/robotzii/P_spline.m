function y_interp = P_spline(coef, x, x_interp)
    % si(x) = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n-1
    % coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
    % x = [x0, x1, ..., xn]
    % y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1

    n = length(x) - 1; %numarul de intervale
    n_interp = length(x_interp);
    y_interp = zeros(n_interp, 1);

    for i = 1 : n_interp
        idx = 0; %folosim implicit s_0
        if x_interp(i) >= x(n + 1)
            idx = n - 1; %folosim s_n-1 pentru x_interp(i) >= x(n)
        elseif x_interp(i) >= x(1)
            %cautare binara pentru a gasi intervalul [x(j), x(j+1))
            left = 1;
            right = n;
            while left <= right
                mid = floor((left + right) / 2);
                if x_interp(i) >= x(mid) && x_interp(i) < x(mid + 1)
                    idx = mid - 1;
                    break;
                elseif x_interp(i) < x(mid)
                    right = mid - 1;
                else
                    left = mid + 1;
                end
            end
        end
        %coeficientii pentru s_idx
        a_idx = coef(4 * idx + 1);
        b_idx = coef(4 * idx + 2);
        c_idx = coef(4 * idx + 3);
        d_idx = coef(4 * idx + 4);
        %calculam y_interp(i) = s_idx(x_interp(i))
        val = x_interp(i) - x(idx + 1);
        P_spline = a_idx + b_idx * val + c_idx * val ^ 2 + d_idx * val ^ 3;
        %y_interp(i) = P_spline(x_interp(i))
        y_interp(i) = P_spline;
    end
end
