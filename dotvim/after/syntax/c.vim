" This file adds detection of Pnl types for syntax highlighting
" Jerome Lelong <jerome.lelong@imag.fr>
"
" Add the content of this file to ~/.vim/after/syntax/c.vim
" or create it if it does not exist

syn keyword cType PnlRng PnlType  PnlVect PnlVectInt PnlVectComplex PnlMat PnlMatInt PnlMatComplex PnlSpMat PnlSpMatInt PnlSpMatComplex PnlTridiagMat PnlTridiagMatLU PnlBandMat PnlHmat PnlHmatInt PnlHmatComplex PnlRng PnlBasis PnlList PnlObject PnlArray PnlPermutation PnlCell
syn keyword cType dcomplex ulong
syn match cType 'Pnl[a-zA-Z]*Object'
syn match cType 'Pnl[0-9a-zA-Z]*Func[0-9a-zA-Z]*'
syn keyword cConstant CONE CZERO

" Nsp types
syn keyword cType NspAstNode NspBHash NspBMatrix NspCells NspCholmod NspFile NspFunction NspHash NspHobj NspIMatrix NspIVect NspList NspLmo doubleC NspMatrix NspMe NspMod NspModule NspModuleElt NspMaxpMatrix NspNone NspObject NspPList NspPMatrix NspScalExp NspSerial NspSMatrix NspSMio NspSpColMatrix NspSpRowMatrix NspType NspUmfpack

" MPI types
syn keyword cType MPI_Group MPI_Status MPI_Request MPI_Win MPI_Aint
syn keyword cType MPI_Info MPI_Op MPI_Datatype MPI_Comm
syn match cConstant 'MPI_[A-Z_]*\>'
