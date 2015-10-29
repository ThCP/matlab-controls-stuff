function [ h ] = my_legend(labels, fontsize)

h = legend(labels);
set (h, 'Interpreter', 'Latex', 'Fontsize', fontsize);

end