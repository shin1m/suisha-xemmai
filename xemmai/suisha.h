#ifndef XEMMAIX__SUISHA__SUISHA_H
#define XEMMAIX__SUISHA__SUISHA_H

#include <suisha/loop.h>
#include <xemmai/convert.h>

namespace xemmaix::suisha
{

using namespace ::suisha;
using namespace xemmai;

class t_wait;
class t_timer;
class t_loop;

class t_library : public xemmai::t_library
{
#define XEMMAIX__SUISHA__TYPES(_)\
	_(wait)\
	_(timer)\
	_(loop)
	XEMMAIX__SUISHA__TYPES(XEMMAI__TYPE__DECLARE)

	static void f_main(t_library* a_library, const t_pvalue& a_callable);

public:
	using xemmai::t_library::t_library;
	XEMMAI__LIBRARY__MEMBERS
};

XEMMAI__LIBRARY__BASE(t_library, t_global, f_global())
#define XEMMAI__TYPE__LIBRARY t_library
XEMMAIX__SUISHA__TYPES(XEMMAI__TYPE__DEFINE)
#undef XEMMAI__TYPE__LIBRARY

}

#endif
