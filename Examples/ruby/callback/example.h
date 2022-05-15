/* File : example.h */

#include <iostream>

class Callback {
public:
	virtual ~Callback() { 
		std::cout << "Callback::~Callback()" << std:: endl; 
	}

	virtual void run() { 
		std::cout << "Callback::run()" << std::endl; 
	}

    virtual void print_log_message(const char *file, int line) {
    	std::cout << "[flr]" << " [" << file << ":" << line << "]" << std::endl;
    }

};


class Caller {
private:
	Callback *_callback;
public:
	Caller(): _callback(0) {}
	~Caller() {}
	// 由上层脚本语言确定是否手动删除 Callback 对象（上层脚本语言若自带GC，则一般不需调用此方法）
	void delCallback() { delete _callback; _callback = 0; }
	void setCallback(Callback *cb) { _callback = cb; }
	void call() { 
		if (_callback) {
			_callback->run();
			_callback->print_log_message(__FILE__, __LINE__);
		} 
	}
};

// 需要使用 Callback 指针，否则 setCallback 时会出现返祖现象，导致传递不成功
class Caller2 {
private:
	Callback _callback;
public:
	Caller2() {}
	~Caller2() {  }
	void setCallback(Callback cb) { _callback = cb; }
	void call() { 
		_callback.run(); 
	    _callback.print_log_message(__FILE__, __LINE__);
	}
};

