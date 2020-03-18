function vec = getNormalVectorInCorner(P1,P2,P3)
    b = P3-P2;
    c = P1-P2;
    w = (b/norm(b)) + (c/norm(c));
    if w == [0,0]
        w = [-b(2),b(1)];
    end
    vec = -w/norm(w);
end