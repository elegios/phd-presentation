#`-file-line-error` is similar to `--interaction nonstopmode`, but shows the concrete line number
# Remove it, it you want pdflatex to stop on errors
$pdflatex = 'set -o pipefail; texfot pdflatex --cnf-line max_print_line=999 -shell-escape -interaction nonstopmode -halt-on-error -file-line-error %O %S | sed "1b;2b;\$b;s/^/<!!>  /" | rg --passthru "<!!>|(lines?|pages?)\s+\d+(--\d+)?|l\.\d+"';
# $pdflatex = 'set -o pipefail; pdflatex --cnf-line max_print_line=999 -shell-escape -interaction nonstopmode -halt-on-error -file-line-error %O %S | rg --passthru --color=always "(lines?|pages?)\s+\d+(--\d+)?|l\.\d+"';

$lualatex = 'set -o pipefail; texfot lualatex --cnf-line max_print_line=999 -shell-escape -interaction nonstopmode -halt-on-error -file-line-error %O %S | sed "1b;2b;\$b;s/^/<!!>  /" | { rg --passthru "<!!>|(lines?|pages?)\s+\d+(--\d+)?|l\.\d+" || true; }';
# $lualatex = 'set -o pipefail; lualatex --cnf-line max_print_line=999 -shell-escape -interaction nonstopmode -halt-on-error -file-line-error %O %S | { rg --passthru "<!!>|(lines?|pages?)\s+\d+(--\d+)?|l\.\d+" || true; }';

# SumatraPDF updates automatically
$preview_mode = 0;

# automatically call lualatex (instead of latex)
$pdf_mode = 4;

# enable deletion of *.bbl at "latexmk -c"
$bibtex_use = 2;

$aux_dir = 'build';
$emulate_aux = 1;

#remove more files than in the default configuration
@generated_exts = qw(acn acr alg aux code ist fls glg glo gls idx ind lof lot out thm toc tpt);

@default_files = ('presentation.tex')
