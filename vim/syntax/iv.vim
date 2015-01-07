" Vim syntax file
" Language:	Inventor
" Maintainer:	seth
" Last Change:	2009-05-04

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" comment
syn match	ivComment	"#.*"
"syn match	ivComment	"\s#.*"ms=s+1
" Standard numbers
syn match ivNumber		"\<\d\+[ij]\=\>"
syn keyword ivValue	 BASE_COLOR	BLEND CONVEX COUNTERCLOCKWISE DELAYED_BLEND MODULATE NO_WINDING_TYPE ON OVERALL PER_FACE PER_FACE_INDEXED PER_PART PER_PART_INDEXED PER_VERTEX PER_VERTEX_INDEXED PHONG REPEAT SOLID UNKNOWN_SHAPE_TYPE UNPICKABLE
syn region	ivString	start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
" floating point number, with dot, optional exponent
syn match ivFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match ivFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Transpose character and delimiters: Either use just [...] or (...) aswell
syn match ivDelimiter		"[][]"

syn match ivMacro			"\%(USE\|DEF\) [^ ]\+"
syn keyword ivSuper		Separator Group 

syn keyword ivClass		Array BaseColor Calculator Complexity Cone Coordinate3 Cube Cylinder DrawStyle FaceSet File IndexedFaceSet IndexedLineSet Info LightModel Material MaterialBinding MatrixTransform Normal NormalBinding PerspectiveCamera PickStyle PointSet Rotation RotationXYZ Rotor Scale ShapeHints Sphere Texture2 TextureCoordinate2 TextureCoordinateBinding TimeCounter Transform Translation TransparencyType

syn keyword ivFunction ambientColor angle axis blendColor bottomRadius center coordIndex creaseAngle depth diffuseColor emissiveColor expression faceType filename frequency height lightWidth lineWidth materialIndex matrix max min model name normalIndex numElements1 numVertices pickCulling point pointSize position renderCaching renderCulling radius rgb rotation scaleFactor scaleOrientation separation1 shapeType shininess specularColor string style textureCoordIndex translation transparency type value vector vertexOrdering width windingType wrapS wrapT

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_iv_syntax_inits")
  if version < 508
    let did_iv_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

hi def link ivComment 	Comment
hi def link ivSuper			Operator
hi def link ivDelimiter	Identifier
hi def link ivString		Number
hi def link ivNumber		Number
hi def link ivFloat			Float
hi def link ivClass			Function
hi def link ivFunction	Type
hi def link ivMacro			PreProc
hi def link ivValue			Number

  delcommand HiLink
endif

let b:current_syntax = "iv"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
