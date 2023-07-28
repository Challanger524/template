constexpr unsigned int GetSizeOfType_impl(unsigned int type)
{
	switch (type)
	{
	case GL_FLOAT:         return 4u;
	case GL_UNSIGNED_INT:  return 4u;
	case GL_UNSIGNED_BYTE: return 1u;
	}

	return 0;
}

template <unsigned int type>
constexpr unsigned int GetSizeOfType()
{
	const auto ret = GetSizeOfType_impl(type);
	static_assert(ret);
	return ret;
}

unsigned int GetSizeOfType(unsigned int type)
{
	const auto ret = GetSizeOfType_impl(type);
	ASSERT(ret);
	return ret;
}

GetSizeOfType<GL_FLOAT>();      // compile-time
GetSizeOfType(GL_UNSIGNED_INT); // runtime
