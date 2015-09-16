for i = 1:10
% Our fake points (in 3D)
A = rand(100,2);
% Compute the Voronoi diagram
[X, C] = voronoin(A);
figure;
hold on;
%scatter3(A(:, 1), A(:, 2), A(:, 3));
scatter(A(:, 1), A(:, 2));
% Compute the N-D convex hull of the diagram
for f = 1:length(C)
    curIDs = C{f};
    disp(curIDs);
    if (sum(ismember(1, curIDs)))
        continue;
    end
    curX = X(curIDs, :);
    K = convhull(curX);
    disp(curX(K));
    % Look at what this does
    plot(curX(K, 1), curX(K, 2));
    %trisurf(K, curX(:,1), curX(:,2), curX(:,3));
end
K = convhull(A);
%trisurf(K, A(:, 1), A(:, 2), A(:, 3), 'k');
plot(A(K, 1), A(K, 2));
hold off;
end