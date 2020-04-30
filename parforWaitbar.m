function a = parforWaitbar(N)
global D
global h

D = parallel.pool.DataQueue;

h = waitbar(0, 'Please wait ...');
afterEach(D, @nUpdateWaitbar);

p = 1;

    function nUpdateWaitbar(~)
        waitbar(p/N, h);
        p = p + 1;
    end
end