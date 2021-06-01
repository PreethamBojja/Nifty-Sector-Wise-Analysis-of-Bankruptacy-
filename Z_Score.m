function [Z,Status] = Z_Score(Type,T)
    TotalAssets = (T(:,1));
    RetainedEarnings = (T(:,2));
    WorkingCapital = (T(:,3));
    TotalLiabilities = (T(:,4));
    EarningsBeforeInterestandTax = (T(:,5));
    TotalSales = (T(:,6));
    MarketCap = (T(:,7));

    X1 = WorkingCapital./TotalAssets;
    X2 = RetainedEarnings./TotalAssets;
    X3 = EarningsBeforeInterestandTax./TotalAssets;
    X4 = MarketCap./TotalLiabilities;
    X5 = TotalSales./TotalAssets;
    
    if strcmp(Type{1},'Non Manufacturing')
        Z = 6.56.*X1 + 3.26.*X2 + 6.72.*X3 + 1.05.*X4 ;
        for i=1:length(Z)
            if Z(i) > 2.60
                Status{i} = 'Safe Zone';    
            elseif 1.10 < Z(i) && Z(i) < 2.60
                Status{i} = 'Gray Zone';
            else 
                Status{i} = 'Distress Zone';
            end
        end
    else
        Z = 1.2*X1 + 1.4*X2 + 3.3*X3 + 0.6*X4 + 1.0*X5;
        for i=1:length(Z)
            if Z(i) > 2.99
                Status{i} = 'Safe Zone';    
            elseif 1.81 < Z(i) && Z(i) < 2.99
                Status{i} = 'Gray Zone';
            else 
                Status{i} = 'Distress Zone';
            end
        end
    end
    
end

