in1 = intersect(doc_struct.ruen.top100.Word, doc_struct.gb.top100.Word);
in2 = intersect(doc_struct.ruen.top100.Word, doc_struct.us.top100.Word);
in3 = intersect(doc_struct.us.top100.Word, doc_struct.gb.top100.Word);

in = intersect(in1, in2);

in = intersect(in, in3);

ind = zeros(size(in));

cnt = zeros(size(in, 1), 3);

for rw = 1:size(in, 1)
    ind(rw,1) = find(strcmp(doc_struct.ruen.top100.Word, in(rw)));
    cnt(rw,1) = doc_struct.ruen.top100.Count(ind(rw,1));
    
    ind(rw,2) = find(strcmp(doc_struct.gb.top100.Word, in(rw)));
    cnt(rw,2) = doc_struct.gb.top100.Count(ind(rw,2));
    
    ind(rw,3) = find(strcmp(doc_struct.us.top100.Word, in(rw)));
    cnt(rw,3) = doc_struct.us.top100.Count(ind(rw,3));
end

bar(categorical(in), cnt);
legend({'Россия', 'Великобритания', 'США'}, 'Location', 'northwest');

xlabel('Общее слово');
ylabel('Количество');

title({'Общие слова в поздравлениях и их количества', ...
    'для России, Великобритании и США за 1999-2020 годы'});

grid on;
grid minor;