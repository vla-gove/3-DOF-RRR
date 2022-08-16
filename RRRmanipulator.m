startup_rvc;

L(1) = Link([0 0 1 pi/2]);
L(2) = Link([0 1 1 0]);
L(3) = Link([0 0 1 0]);

robot = SerialLink(L, 'name', 'RRR robot');
robot.display()
robot.teach()
hold on 

var = sym('q',[3 1]);
assume(var,'real');

q={5 5 5};
[Q{1:numel(q)}] = ndgrid(q{:}); 
T = simplify(vpa(robot.fkine(var),3));
Pos=T;
x(var(:)) = Pos(1);
X = matlabFunction(x);
X = X(Q{:});
y(var(:)) = Pos(2);
Y = matlabFunction(y);
Y = Y(Q{:});
z(var(:)) = Pos(3);
Z = matlabFunction(z);
Z = Z(Q{:});

plot3(X(:),Y(:),Z(:),'r.')
xlabel('X')
ylabel('Y')
zlabel('Z')