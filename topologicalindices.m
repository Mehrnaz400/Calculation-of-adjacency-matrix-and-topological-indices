
B = input('Enter the edges of the graph: ');
numNodes = input('Enter the number of vertices:');

adjMatrix = zeros(numNodes);

for i = 1:size(B, 1)
    adjMatrix(B(i, 1), B(i, 2)) = 1;
    adjMatrix(B(i, 2), B(i, 1)) = 1;
end

disp(adjMatrix)

A = adjMatrix;

degree = sum(A);

D = zeros(size(A));
T = zeros(size(A));
H = zeros(size(A));
M = zeros(size(A));
R = zeros(size(A));
F = zeros(size(A));
S = zeros(size(A));
I = zeros(size(A));
AZ = zeros(size(A));
RA = zeros(size(A));
IR = zeros(size(A));
HZ = zeros(size(A));
ABC = zeros(size(A));
SC = zeros(size(A));

for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j) == 1
            D(i,j) = degree(i) + degree(j);
            T(i,j) = degree(i) * degree(j);
            H(i,j) = 2/D(i,j);
            H(j,i) = H(i,j);
            M(i,j) = 1/(degree(i) * degree(j));
            R(i,j) = T(i,j)*D(i,j);
            F(i,j) = degree(i)^2 + degree(j)^2;
            S(i,j) = F(i,j)/ T(i,j);
            I(i,j) = T(i,j)/ D(i,j);
            AZ(i,j) = (T(i,j)/ (D(i,j)-2))^3;
            RA(i,j) = T(i,j)^(-1/2);
            IR(i,j) = 1/RA(i,j);
            HZ(i,j) = D(i,j)^2;
            ABC(i,j) = ((D(i,j)-2)/T(i,j))^(1/2);
            SC(i,j) = 1/(D(i,j))^(1/2);
        end
    end
end


result1 = 1;
Zagreb1 = 0;
result2 = 1;
Zagreb2 = 0;
Harmonic = 0;
modifiedzagrab = 0;
result3 = 1;
RefZ = 0;
Forgotten =0;
SDD =0;
Inverse = 0;
Augment = 0;
Randic = 0;
InRandic = 0;
HZagreb = 0;
Atombond = 0;
Sumconnect = 0;

for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j) == 1
            result1 = result1 * (D(i,j)^D(i,j));
            Zagreb1 = Zagreb1 + D(i,j);
            result2 = result2 * (T(i,j)^T(i,j));
            Zagreb2 = Zagreb2 + T(i,j);
            Harmonic = Harmonic + H(i,j);
            modifiedzagrab = modifiedzagrab + M(i,j);
            result3 = result3 + (R(i,j)* log10(R(i,j)));
            RefZ = RefZ + R(i,j);
            Forgotten = Forgotten + F(i,j);
            SDD = SDD + S(i,j);
            Inverse = Inverse + I(i,j);
            Augment = Augment + AZ(i,j);
            Randic = Randic + RA(i,j);
            InRandic = InRandic + IR(i,j);
            HZagreb = HZagreb + HZ(i,j);
            Atombond = Atombond + ABC(i,j);
            Sumconnect = Sumconnect + SC(i,j);

        end
    end
end

inv_Zagreb1 = 1/Zagreb1;
inv_Zagreb2 = 1/Zagreb2;
inv_Harmonic = 1/Harmonic;
inv_modifiedzagrab = 1/modifiedzagrab;
inv_RefZ = 1/RefZ;
inv_Forgotten = 1/Forgotten;
inv_SDD = 1/SDD;
inv_Inverse = 1/Inverse;
inv_Augment = 1/Augment;
inv_Randic = 1/Randic;
inv_InRandic = 1/InRandic;
inv_HZagreb = 1/HZagreb;
inv_Atombond = 1/Atombond;
inv_Sumconnect = 1/Sumconnect;

result1 = log10(result1);
result2 = log10(result2);
result3 = log10(result3);
result3 = log10(RefZ)- (inv_RefZ * result3);


disp(['The first Zagreb index is:', num2str(Zagreb1)]);
disp(['The second Zagreb index is:', num2str(Zagreb2)]);
disp(['The Hyper Zagreb index is:', num2str(HZagreb)]);
disp(['The H-index is:', num2str(Harmonic)]);
disp(['The modified Zagreb index is:', num2str(modifiedzagrab)]);
disp(['The Refined third Zagreb index is:', num2str(RefZ)]);
disp(['The F-index is:', num2str(Forgotten)]);
disp(['The SDD index is: ', num2str(SDD)]);
disp(['The Inverse sum indeg index is: ', num2str(Inverse)]);
disp(['The Augment Zagreb index is: ', num2str(Augment)]);
disp(['The Randic index is: ', num2str(Randic)]);
disp(['The Inverse Randic index is: ', num2str(InRandic)]);
disp(['The Atom bond connectivity index is: ', num2str(Atombond)]);
disp(['The Sum connectivity index is: ', num2str(Sumconnect)]);